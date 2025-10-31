@if($pipelines->count() > 0)
<div class="space-y-6">
    @foreach($pipelines as $pipelineId => $pipeline)
    <div class="bg-white p-4 rounded-lg shadow mb-6">
        <h3 class="font-semibold text-gray-700 mb-2 text-lg">📊 Pipeline: {{ $pipeline['name'] }}</h3>

        @foreach($pipeline['stages'] as $stageId => $stage)
        <div class="mb-4 ml-4">
            <h4 class="font-medium text-gray-600 mb-1 text-md">🚩 Stage: {{ $stage['name'] }}</h4>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 text-sm mb-2 border border-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Opportunity</th>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Entered At</th>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Left At</th>
                            <td class="px-4 py-2 text-left font-medium text-gray-600 border-b">Next Satge</td>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Time Spent</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        @forelse($stage['stageLogs'] as $log)
                        @php
                            $entered = $log->start_date ? \Carbon\Carbon::parse($log->start_date) : null;
                            $left = $log->end_date ? \Carbon\Carbon::parse($log->end_date) : null;
                            $timeSpent = $entered && $left ? $entered->diffForHumans($left, true)
                                        : ($entered ? 'In Progress' : '-');
                        @endphp
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-2 text-gray-800 border-b">{{ $log->opportunity_name ?? '-' }}</td>
                            <td class="px-4 py-2 text-gray-600 border-b">{{ $entered?->format('Y-m-d H:i') ?? '-' }}</td>
                            <td class="px-4 py-2 text-gray-600 border-b">{{ $left?->format('Y-m-d H:i') ?? '-' }}</td>
                             <td class="px-4 py-2 text-gray-600 border-b">
                                @if ($log->next_stage_name)
                                    → <strong>{{ $log->next_stage_name }}</strong>
                                @endif
                            </td>
                            <td class="px-4 py-2 border-b {{ $left ? 'text-gray-600' : 'text-blue-600 font-semibold' }}">
                                {{ $timeSpent }}
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="4" class="px-4 py-2 text-gray-500 text-center border-b">No logs found for this stage</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
        @endforeach
    </div>
    @endforeach
</div>
@else
<div class="text-center py-8 bg-white rounded-lg shadow">
    <p class="text-gray-500 text-lg">No stage history data available.</p>
</div>
@endif