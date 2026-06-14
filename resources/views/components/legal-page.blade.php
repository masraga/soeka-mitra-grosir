@props(['title', 'intro' => null])

<div class="max-w-4xl mx-auto px-4 sm:px-6 py-10 sm:py-14">
    <div class="bg-white border border-gray-100 rounded-2xl shadow-sm p-6 sm:p-10">
        <div class="border-b border-gray-100 pb-6 mb-8">
            <p class="text-sm font-semibold uppercase tracking-widest text-green-600">Informasi Pelanggan</p>
            <h1 class="mt-2 text-3xl sm:text-4xl font-bold text-gray-900">{{ $title }}</h1>
            @if($intro)
                <p class="mt-4 text-gray-600 leading-7">{{ $intro }}</p>
            @endif
        </div>

        <article class="legal-content space-y-8 text-gray-600 leading-7">
            {{ $slot }}
        </article>
    </div>
</div>
