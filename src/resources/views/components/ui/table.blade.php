@props(['options'])

<table
    class="w-full shadow-sm"
    style="text-align: center;"
>
    <!-- Header -->
    <thead
        class="block overflow-y-auto w-full"
    >
    <tr
        class="table w-full"
        style="table-layout: fixed;"
    >
        @foreach($options['header']['items'] as $index => $item)
            <th
                class="py-1 pb-4 font-normal uppercase text-xs text-gray-500 hover:cursor-pointer relative
                {{ tableRowsClassObject($options, $index,false) }}">
                {{  $item['name'] }}
            </th>
        @endforeach
    </tr>
    </thead>

    <tbody
        class="block overflow-y-auto w-full border-t border-gray-200"
        style="max-height: calc(100vh - (32px * 2) - 72px - 65px - 38px);"
    >

    <!-- Table rows , scoped slots -->
    @forelse($options['data']['items'] as $item)
        <tr
            class="hover:cursor-pointer hover:bg-gray-100 table w-full"
            style="table-layout: fixed;"
            @isset($options['data']['onclick'])
            onclick="window.location = '{{ url($options['data']['onclick']) }}/{{ $item->id }}'"
            @endisset
        >
            {{ $tableitem($item) }}
        </tr>
    @empty
        <!-- Empty message -->
        <tr
            class="table w-full"
            style="table-layout: fixed;"
        >
            <td
                class="py-3 border-b border-gray-200"
                colspan="{{ count($options['header']['items']) }}"
            >
                <p class="text-gray-600 px-6 text-left">
                    {{ $options['data']['empty'] }}
                </p>
            </td>
        </tr>
    @endforelse
    </tbody>
</table>
@isset($options['pagination'])
    <div
        class="flex flex-row p-2 items-center pl-5"
    >
        <x-ui.button
            class="rounded h-8"
            icon="fas fa-chevron-left"
            primary
            type="link"
            :href="Request::url().'?'. http_build_query(array_merge(Request::query(), ['page' => $options['pagination']->current_page-1]))"
            :disabled="$options['pagination']->current_page == 1 ? true : false"
        >

        </x-ui.button>
        <span class="text-gray-500 mx-2">
            <span class="font-bold">{{$options['pagination']->current_page}}</span>
            of
            <span class="font-bold">{{$options['pagination']->total_pages}}</span>
        </span>
        <x-ui.button
            class="rounded h-8"
            icon="fas fa-chevron-right"
            primary
            type="link"
            :href="Request::url().'?'. http_build_query(array_merge(Request::query(), ['page' => $options['pagination']->current_page+1]))"
            :disabled="$options['pagination']->current_page == $options['pagination']->total_pages ? true : false"
        ></x-ui.button>
    </div>
@endisset
