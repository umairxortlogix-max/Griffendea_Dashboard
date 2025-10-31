@if ($logs->hasPages())
<div class="flex flex-col sm:flex-row items-center justify-between gap-4 mt-6 px-4 py-3 bg-gray-50 rounded-lg border border-gray-200">
    <!-- Showing results info -->
    <div class="text-sm text-gray-700">
        Showing {{ $logs->firstItem() }} to {{ $logs->lastItem() }} of {{ $logs->total() }} results
    </div>

    <!-- Pagination Links -->
    <div class="flex items-center gap-2">
        <!-- Previous Page Link -->
        @if ($logs->onFirstPage())
            <span class="px-3 py-1 text-gray-400 bg-white border border-gray-300 rounded cursor-not-allowed">
                &laquo; Previous
            </span>
        @else
            <a href="#" class="pagination-link px-3 py-1 text-blue-600 bg-white border border-gray-300 rounded hover:bg-gray-50 transition"
               data-page="{{ $logs->currentPage() - 1 }}">
                &laquo; Previous
            </a>
        @endif

        <!-- Page Numbers -->
        <div class="flex items-center gap-1">
            @foreach ($logs->getUrlRange(1, $logs->lastPage()) as $page => $url)
                @if ($page == $logs->currentPage())
                    <span class="px-3 py-1 text-white bg-blue-600 border border-blue-600 rounded">{{ $page }}</span>
                @else
                    <a href="#" class="pagination-link px-3 py-1 text-blue-600 bg-white border border-gray-300 rounded hover:bg-gray-50 transition"
                       data-page="{{ $page }}">{{ $page }}</a>
                @endif
            @endforeach
        </div>

        <!-- Next Page Link -->
        @if ($logs->hasMorePages())
            <a href="#" class="pagination-link px-3 py-1 text-blue-600 bg-white border border-gray-300 rounded hover:bg-gray-50 transition"
               data-page="{{ $logs->currentPage() + 1 }}">
                Next &raquo;
            </a>
        @else
            <span class="px-3 py-1 text-gray-400 bg-white border border-gray-300 rounded cursor-not-allowed">
                Next &raquo;
            </span>
        @endif
    </div>

    <!-- Go to Page -->
    <div class="flex items-center gap-2 text-sm">
        <span class="text-gray-700">Go to page:</span>
        <input type="number" id="pageInput" min="1" max="{{ $logs->lastPage() }}" 
               class="w-16 px-2 py-1 border border-gray-300 rounded text-center"
               value="{{ $logs->currentPage() }}">
        <button id="goToPageBtn" class="px-3 py-1 text-white bg-blue-600 rounded hover:bg-blue-700 transition">
            Go
        </button>
    </div>
</div>
@endif