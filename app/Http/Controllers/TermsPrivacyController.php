<?php

namespace App\Http\Controllers;

class TermsPrivacyController extends Controller
{
    public function index()
    {
        return redirect()->route('pages.privacy');
    }
}
