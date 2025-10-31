
<?php $__env->startSection('content'); ?>
<div class="wrapper">
    <div class="mx-auto max-w-8xl px-4 py-6 sm:px-6 lg:px-8">

        <!-- Header Tabs -->
        <div class="bg-gray-100 p-4 mb-4 rounded-lg shadow-md flex flex-col sm:flex-row sm:items-center sm:justify-between w-full">
            <div class="flex items-center gap-4 mb-3 sm:mb-0">
                <a href="<?php echo e(route('admin.opportunities')); ?>"
                    class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                    <?php echo e(request()->routeIs('admin.opportunities') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                    Opportunities Overview
                </a>
                <a href="<?php echo e(route('admin.opportunitiesTable')); ?>"
                    class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                    <?php echo e(request()->routeIs('admin.opportunitiesTable') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                   Opportunity Log
                </a>
                <a href="<?php echo e(route('admin.OpportunityStageHistory')); ?>"
                    class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                    <?php echo e(request()->routeIs('admin.OpportunityStageHistory') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                    Stage History
                </a>
            </div>
        </div>

        <h2 class="text-2xl font-bold text-gray-800 mb-6">📊 Opportunity Logs</h2>

        <!-- Filters -->
        <div class="flex flex-wrap gap-4 mb-4 items-end">
            <!-- Pipeline Filter -->
            <div>
                <label for="filterByUser" class="text-sm font-medium text-gray-700"><b>Pipeline</b></label>
                <select name="pipeline_id" id="filterByUser"
                    class="w-52 rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-700 shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition">
                    <option value="">--Select Pipeline--</option>
                    <?php $__currentLoopData = $pipelines; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $pipeline): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($pipeline->pipeline_id); ?>"><?php echo e($pipeline->name); ?></option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </div>

            <!-- Start Date -->
            <div>
                <label for="startDate" class="text-sm font-medium text-gray-700"><b>Start Date</b></label>
                <input type="date" id="startDate" class="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-200">
            </div>

            <!-- End Date -->
            <div>
                <label for="endDate" class="text-sm font-medium text-gray-700"><b>End Date</b></label>
                <input type="date" id="endDate" class="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-200">
            </div>

            <!-- Items Per Page -->
            <div>
                <label for="perPage" class="text-sm font-medium text-gray-700"><b>Items Per Page</b></label>
                <select id="perPage" class="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-200">
                    <option value="10">10</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
            </div>

            <!-- Filter Button -->
            <div>
                <button id="applyFilter"
                    class="bg-blue-600 text-white px-4 py-2 rounded-lg shadow hover:bg-blue-700 transition">Apply</button>
            </div>
        </div>

        <!-- Table Wrapper -->
        <div class="relative bg-white p-4 rounded-lg shadow">

            <!-- 🔄 Loader -->
            <div id="tableLoader" class="absolute inset-0 flex items-center justify-center bg-white/70 backdrop-blur-sm hidden z-10">
                <div class="animate-spin rounded-full h-10 w-10 border-4 border-blue-500 border-t-transparent"></div>
            </div>

            <!-- Table -->
            <table class="min-w-full divide-y divide-gray-200 text-sm border border-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-3 py-2 text-left font-medium text-gray-600">Pipeline</th>
                        <th class="px-3 py-2 text-left font-medium text-gray-600">Stage</th>
                        <th class="px-3 py-2 text-left font-medium text-gray-600">Logged Date</th>
                        <th class="px-3 py-2 text-left font-medium text-gray-600">Opportunity Count</th>
                    </tr>
                </thead>
                <tbody id="opportunityTableBody">
                    
                </tbody>
            </table>

            <!-- Pagination -->
            <div id="paginationContainer" class="mt-4">
                
            </div>
        </div>

    </div>
</div>

<!-- ✅ AJAX Script -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const dropdown = document.getElementById('filterByUser');
    const startDate = document.getElementById('startDate');
    const endDate = document.getElementById('endDate');
    const perPage = document.getElementById('perPage');
    const applyFilter = document.getElementById('applyFilter');
    const tableBody = document.getElementById('opportunityTableBody');
    const paginationContainer = document.getElementById('paginationContainer');
    const loader = document.getElementById('tableLoader');

    function fetchData(page = 1) {
        const pipeline_id = dropdown.value;
        const start_date = startDate.value;
        const end_date = endDate.value;
        const per_page = perPage.value;

        loader.classList.remove('hidden'); // show loader

        const params = new URLSearchParams({
            pipeline_id,
            start_date,
            end_date,
            per_page,
            page
        });

        fetch(`<?php echo e(route('admin.opportunitiesTable')); ?>?${params.toString()}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
        .then(res => res.json())
        .then(data => {
            tableBody.innerHTML = data.html;
            paginationContainer.innerHTML = data.pagination || '';
            
            // Re-attach pagination event listeners
            attachPaginationListeners();
        })
        .catch(err => {
            console.error('Error fetching data:', err);
        })
        .finally(() => {
            loader.classList.add('hidden'); // hide loader
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

    // Load initial data
    fetchData();

    // On click apply
    applyFilter.addEventListener('click', () => fetchData(1));

    // On change per page
    perPage.addEventListener('change', () => fetchData(1));
});
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.index', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/opportunitiesTable.blade.php ENDPATH**/ ?>