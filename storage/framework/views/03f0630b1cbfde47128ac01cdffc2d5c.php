<?php if($logs->hasPages()): ?>
<div class="flex flex-col sm:flex-row items-center justify-between gap-4 mt-6 px-4 py-3 bg-gray-50 rounded-lg border border-gray-200">
    <!-- Showing results info -->
    <div class="text-sm text-gray-700">
        Showing <?php echo e($logs->firstItem()); ?> to <?php echo e($logs->lastItem()); ?> of <?php echo e($logs->total()); ?> results
    </div>

    <!-- Pagination Links -->
    <div class="flex items-center gap-2">
        <!-- Previous Page Link -->
        <?php if($logs->onFirstPage()): ?>
            <span class="px-3 py-1 text-gray-400 bg-white border border-gray-300 rounded cursor-not-allowed">
                &laquo; Previous
            </span>
        <?php else: ?>
            <a href="#" class="pagination-link px-3 py-1 text-blue-600 bg-white border border-gray-300 rounded hover:bg-gray-50 transition"
               data-page="<?php echo e($logs->currentPage() - 1); ?>">
                &laquo; Previous
            </a>
        <?php endif; ?>

        <!-- Page Numbers -->
        <div class="flex items-center gap-1">
            <?php $__currentLoopData = $logs->getUrlRange(1, $logs->lastPage()); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $page => $url): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($page == $logs->currentPage()): ?>
                    <span class="px-3 py-1 text-white bg-blue-600 border border-blue-600 rounded"><?php echo e($page); ?></span>
                <?php else: ?>
                    <a href="#" class="pagination-link px-3 py-1 text-blue-600 bg-white border border-gray-300 rounded hover:bg-gray-50 transition"
                       data-page="<?php echo e($page); ?>"><?php echo e($page); ?></a>
                <?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>

        <!-- Next Page Link -->
        <?php if($logs->hasMorePages()): ?>
            <a href="#" class="pagination-link px-3 py-1 text-blue-600 bg-white border border-gray-300 rounded hover:bg-gray-50 transition"
               data-page="<?php echo e($logs->currentPage() + 1); ?>">
                Next &raquo;
            </a>
        <?php else: ?>
            <span class="px-3 py-1 text-gray-400 bg-white border border-gray-300 rounded cursor-not-allowed">
                Next &raquo;
            </span>
        <?php endif; ?>
    </div>

    <!-- Go to Page -->
    <div class="flex items-center gap-2 text-sm">
        <span class="text-gray-700">Go to page:</span>
        <input type="number" id="pageInput" min="1" max="<?php echo e($logs->lastPage()); ?>" 
               class="w-16 px-2 py-1 border border-gray-300 rounded text-center"
               value="<?php echo e($logs->currentPage()); ?>">
        <button id="goToPageBtn" class="px-3 py-1 text-white bg-blue-600 rounded hover:bg-blue-700 transition">
            Go
        </button>
    </div>
</div>
<?php endif; ?><?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/partials/pagination.blade.php ENDPATH**/ ?>