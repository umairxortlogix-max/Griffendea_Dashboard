@extends('admin.layouts.index')
@section('content')
<div class="wrapper">
    <div class="mx-auto max-w-8xl px-4 py-6 sm:px-6 lg:px-8">

        <!-- ✅ Header Tabs -->
      
            @include('admin.partials.opportunityTab')
   

        <!-- 🧩 Page Content -->
        <!-- Header -->
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between bg-gray-100 p-4 mb-6 rounded-lg shadow">
            <h2 class="text-xl font-bold text-gray-800">Stage History</h2>
            
            <!-- Pagination Controls -->
            <div class="flex flex-wrap gap-4 items-center mt-3 sm:mt-0">
                <!-- Items Per Page -->
                <div>
                    <label for="perPage" class="text-sm font-medium text-gray-700"><b>Items Per Page</b></label>
                    <select id="perPage" class="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-200">
                       <option value="50" {{ request('per_page', 50) == 50 ? 'selected' : '' }}>50</option>
                        <option value="10" {{ request('per_page', 50) == 10 ? 'selected' : '' }}>10</option>
                        <option value="25" {{ request('per_page', 50) == 25 ? 'selected' : '' }}>25</option>
                        
                        <option value="100" {{ request('per_page', 50) == 100 ? 'selected' : '' }}>100</option>
                    </select>
                </div>

                <!-- Refresh Button -->
                <div>
                    <button id="refreshData"
                        class="bg-green-600 text-white px-4 py-2 rounded-lg shadow hover:bg-green-700 transition">
                        🔄 Refresh
                    </button>
                </div>
            </div>
        </div>

        <!-- Table Wrapper -->
        <div class="relative bg-white p-6 rounded-lg shadow">

            <!-- 🔄 Loader -->
            <div id="tableLoader" class="absolute inset-0 flex items-center justify-center bg-white/70 backdrop-blur-sm hidden z-10">
                <div class="animate-spin rounded-full h-10 w-10 border-4 border-blue-500 border-t-transparent"></div>
            </div>

            <!-- Stage History Content -->
            <div id="stageHistoryContent">
                @include('admin.partials.stage_history_table', ['pipelines' => $pipelines])
            </div>

            <!-- Pagination -->
            <div id="paginationContainer" class="mt-6">
                @if(isset($paginatedLogs))
                    @include('admin.partials.pagination', ['logs' => $paginatedLogs])
                @endif
            </div>
        </div>

    </div>
</div>
@endsection

@section('scripts')
<!-- Your existing scripts... -->

<script>
document.addEventListener('DOMContentLoaded', function() {
    const perPage = document.getElementById('perPage');
    const refreshBtn = document.getElementById('refreshData');
    const contentContainer = document.getElementById('stageHistoryContent');
    const paginationContainer = document.getElementById('paginationContainer');
    const loader = document.getElementById('tableLoader');

    function fetchData(page = 1) {
        const per_page = perPage.value;

        loader.classList.remove('hidden');

        const params = new URLSearchParams({
            per_page,
            page
        });

        fetch(`{{ route('admin.OpportunityStageHistory') }}?${params.toString()}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json'
            }
        })
        .then(res => {
            if (!res.ok) {
                throw new Error('Network response was not ok');
            }
            return res.json();
        })
        .then(data => {
            if (data.html) {
                contentContainer.innerHTML = data.html;
            }
            if (data.pagination) {
                paginationContainer.innerHTML = data.pagination;
            }
            
            // Re-attach pagination event listeners
            attachPaginationListeners();
        })
        .catch(err => {
            console.error('Error fetching data:', err);
            contentContainer.innerHTML = '<div class="text-center py-8 text-red-500">Error loading data. Please try again.</div>';
        })
        .finally(() => {
            loader.classList.add('hidden');
        });
    }

    function attachPaginationListeners() {
        // Handle pagination links
        document.querySelectorAll('.pagination-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const page = this.getAttribute('data-page');
                if (page) {
                    fetchData(page);
                }
            });
        });

        // Handle page input
        const pageInput = document.getElementById('pageInput');
        const goToPageBtn = document.getElementById('goToPageBtn');
        
        if (pageInput && goToPageBtn) {
            goToPageBtn.addEventListener('click', function() {
                const page = pageInput.value;
                if (page && page > 0) {
                    fetchData(page);
                }
            });

            pageInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    const page = this.value;
                    if (page && page > 0) {
                        fetchData(page);
                    }
                }
            });
        }
    }

    // Event Listeners
    perPage.addEventListener('change', () => fetchData(1));
    refreshBtn.addEventListener('click', () => fetchData(1));

    // Initial attachment of pagination listeners
    attachPaginationListeners();
});
</script>
@endsection