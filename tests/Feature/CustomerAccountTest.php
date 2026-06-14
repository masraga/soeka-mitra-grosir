<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CustomerAccountTest extends TestCase
{
    use RefreshDatabase;

    public function test_guest_account_link_opens_customer_login(): void
    {
        $this->get('/')
            ->assertOk()
            ->assertSee(route('login'))
            ->assertSee(route('register'));

        $this->get(route('customer.profile'))
            ->assertRedirect(route('login'));

        $this->get(route('login'))
            ->assertOk()
            ->assertSee('Login Pelanggan');
    }

    public function test_guest_can_register_and_is_logged_in_as_customer(): void
    {
        $this->get(route('register'))
            ->assertOk()
            ->assertSee('Daftar Pelanggan');

        $this->post(route('customer.register.submit'), [
            'name' => 'Pelanggan Baru',
            'email' => 'BARU@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ])->assertRedirect(route('customer.profile'));

        $customer = User::where('email', 'baru@example.com')->firstOrFail();

        $this->assertSame('customer', $customer->role);
        $this->assertAuthenticatedAs($customer);
    }

    public function test_registration_validates_duplicate_email_and_password_confirmation(): void
    {
        User::factory()->create(['email' => 'existing@example.com']);

        $this->post(route('customer.register.submit'), [
            'name' => 'Pelanggan',
            'email' => 'existing@example.com',
            'password' => 'password123',
            'password_confirmation' => 'different-password',
        ])->assertSessionHasErrors(['email', 'password']);
    }

    public function test_customer_can_login_view_profile_and_logout(): void
    {
        $customer = User::factory()->create([
            'role' => 'customer',
            'password' => 'password',
        ]);

        $this->post(route('customer.login.submit'), [
            'email' => $customer->email,
            'password' => 'password',
        ])->assertRedirect(route('customer.profile'));

        $this->assertAuthenticatedAs($customer);

        $this->get(route('customer.profile'))
            ->assertOk()
            ->assertSee($customer->name)
            ->assertSee($customer->email)
            ->assertSee(route('customer.profile'))
            ->assertDontSee(route('register'));

        $this->post(route('customer.logout'))
            ->assertRedirect(route('home'));

        $this->assertGuest();
    }

    public function test_admin_cannot_login_through_customer_login(): void
    {
        $admin = User::factory()->create([
            'role' => 'admin',
            'password' => 'password',
        ]);

        $this->post(route('customer.login.submit'), [
            'email' => $admin->email,
            'password' => 'password',
        ])->assertSessionHasErrors('email');

        $this->assertGuest();
    }

    public function test_authenticated_users_are_redirected_away_from_registration(): void
    {
        $customer = User::factory()->create(['role' => 'customer']);
        $admin = User::factory()->create(['role' => 'admin']);

        $this->actingAs($customer)
            ->get(route('register'))
            ->assertRedirect(route('customer.profile'));

        $this->actingAs($admin)
            ->get(route('register'))
            ->assertRedirect(route('admin.dashboard'));
    }
}
