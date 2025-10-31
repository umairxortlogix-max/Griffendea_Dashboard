@forelse($logs as $index => $pipelineLogs)
    @foreach($pipelineLogs as $log)
        <tr class="hover:bg-gray-50">
            <td class="px-3 py-2 font-semibold">{{ $log->pipeline_name ?? '-' }}</td>
            <td class="px-3 py-2">{{ $log->stage_name ?? '-' }}</td>
            <td class="px-3 py-2">{{ \Carbon\Carbon::parse($log->logged_date)->format('d M Y') }}</td>
            <td class="px-3 py-2 font-semibold">{{ $log->opportunity_count }}</td>
        </tr>
    @endforeach
@empty
    <tr>
        <td colspan="7" class="text-center py-4 text-gray-500">No records found.</td>
    </tr>
@endforelse
