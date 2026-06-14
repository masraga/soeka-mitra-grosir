<?php

namespace App\Http\Controllers;

use App\Mail\InquiryMessage;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\View\View;

class PageController extends Controller
{
    public function terms(): View
    {
        return view('pages.terms');
    }

    public function returns(): View
    {
        return view('pages.returns');
    }

    public function privacy(): View
    {
        return view('pages.privacy');
    }

    public function partnership(): View
    {
        return view('pages.partnership');
    }

    public function contact(): View
    {
        return view('pages.contact');
    }

    public function submitPartnership(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'partnership_type' => 'required|string|in:horeka,usaha-buah-sayur,supermarket,rumah-tangga,toko-buah,mitra-bertani',
            'name' => 'required|string|max:100',
            'business_name' => 'required|string|max:150',
            'email' => 'required|email:rfc|max:255',
            'phone' => 'required|string|max:30',
            'message' => 'required|string|max:3000',
        ]);

        $types = $this->partnershipTypes();
        $body = implode("\n", [
            'Jenis kerja sama: '.$types[$data['partnership_type']],
            'Nama: '.$data['name'],
            'Nama usaha: '.$data['business_name'],
            'Email: '.$data['email'],
            'No. HP/WhatsApp: '.$data['phone'],
            '',
            'Kebutuhan:',
            $data['message'],
        ]);

        $this->sendMessage('Permintaan Kerjasama - '.$data['business_name'], $body, $data['email'], $data['name']);

        return redirect()->route('pages.partnership')
            ->with('success', 'Permintaan kerjasama berhasil dikirim. Tim kami akan segera menghubungi Anda.');
    }

    public function submitContact(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'name' => 'required|string|max:100',
            'email' => 'required|email:rfc|max:255',
            'message' => 'required|string|max:3000',
        ]);

        $body = implode("\n", [
            'Nama: '.$data['name'],
            'Email: '.$data['email'],
            '',
            'Pesan:',
            $data['message'],
        ]);

        $this->sendMessage('Pesan dari Halaman Hubungi Kami', $body, $data['email'], $data['name']);

        return redirect()->route('pages.contact')
            ->with('success', 'Pesan berhasil dikirim. Tim kami akan segera menghubungi Anda.');
    }

    private function sendMessage(string $subject, string $body, string $replyTo, string $replyToName): void
    {
        $recipient = setting('store_email');

        Mail::to($recipient)->send(new InquiryMessage(
            mailSubject: $subject,
            body: $body,
            replyToEmail: $replyTo,
            replyToName: $replyToName,
        ));
    }

    private function partnershipTypes(): array
    {
        return [
            'horeka' => 'Horeka (Hotel, Restoran & Katering)',
            'usaha-buah-sayur' => 'Membuka Usaha Jualan Buah & Sayur',
            'supermarket' => 'Supermarket & Swalayan',
            'rumah-tangga' => 'Paket Langganan Rumah Tangga',
            'toko-buah' => 'Langganan Grosir untuk Toko',
            'mitra-bertani' => 'Menjadi Mitra Bertani',
        ];
    }
}
