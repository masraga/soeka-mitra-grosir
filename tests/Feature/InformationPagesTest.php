<?php

namespace Tests\Feature;

use App\Mail\InquiryMessage;
use App\Models\Setting;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Mail;
use Tests\TestCase;

class InformationPagesTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        $settings = [
            'store_name' => 'Toko Dinamis',
            'store_phone' => '081299998888',
            'store_email' => 'kontak@tokodinamis.test',
            'store_address' => 'Jl. Pengujian No. 10',
        ];

        foreach ($settings as $key => $value) {
            Setting::updateOrCreate(
                ['key' => $key],
                [
                    'value' => $value,
                    'type' => 'string',
                    'group' => 'store',
                    'label' => $key,
                ],
            );
        }

        Setting::clearCache();
    }

    public function test_information_pages_are_available_and_linked_in_the_footer(): void
    {
        $routes = [
            '/syarat-dan-ketentuan' => 'Syarat dan Ketentuan',
            '/penukaran-dan-pengembalian' => 'Penukaran dan Pengembalian',
            '/kebijakan-privasi' => 'Kebijakan Privasi',
            '/kerjasama' => 'Kerjasama',
            '/hubungi-kami' => 'Hubungi Kami',
        ];

        foreach ($routes as $uri => $title) {
            $this->get($uri)
                ->assertOk()
                ->assertSee($title)
                ->assertSee('Toko Dinamis');
        }

        $this->get('/')
            ->assertOk()
            ->assertSee(route('pages.terms'))
            ->assertSee(route('pages.returns'))
            ->assertSee(route('pages.privacy'))
            ->assertSee(route('pages.partnership'))
            ->assertSee(route('pages.contact'));
    }

    public function test_contact_form_validates_and_sends_an_email(): void
    {
        Mail::fake();

        $this->post(route('pages.contact.submit'), [])
            ->assertSessionHasErrors(['name', 'email', 'message']);

        $this->post(route('pages.contact.submit'), [
            'name' => 'Budi',
            'email' => 'budi@example.com',
            'message' => 'Saya ingin menanyakan ketersediaan produk.',
        ])->assertRedirect(route('pages.contact'));

        Mail::assertSent(
            InquiryMessage::class,
            fn (InquiryMessage $mail) => $mail->hasTo('kontak@tokodinamis.test'),
        );
    }

    public function test_partnership_form_validates_and_sends_an_email(): void
    {
        Mail::fake();

        $this->post(route('pages.partnership.submit'), [])
            ->assertSessionHasErrors(['partnership_type', 'name', 'business_name', 'email', 'phone', 'message']);

        $this->post(route('pages.partnership.submit'), [
            'partnership_type' => 'horeka',
            'name' => 'Sari',
            'business_name' => 'Dapur Sari',
            'email' => 'sari@example.com',
            'phone' => '081234567890',
            'message' => 'Kami membutuhkan pasokan sembako setiap minggu.',
        ])->assertRedirect(route('pages.partnership'));

        Mail::assertSent(
            InquiryMessage::class,
            fn (InquiryMessage $mail) => $mail->hasTo('kontak@tokodinamis.test'),
        );
    }
}
