@props(['name','items','class','selected'])


<div class="bg-gray-300 rounded flex flex-row items-center relative
        @isset($class) {{$class}} @endisset"
>
    <select
        class="bg-gray-300 focus:outline-none block w-full p-2 hover:cursor-pointer"
        style="-moz-appearance: none;-webkit-appearance: none;appearance: none;"
        name="{{$name}}"
        {{$attributes}}
    >
        <option value="" hidden disabled @if(!old($name)) selected @endif>Vyberte možnosť...</option>
        @foreach($items as $item)
            <option
                value="{{$item->id}}"
                @if(old($name) == $item->id) selected @endif
                @if(isset($selected) && !old($name) && $selected == $item->id) selected @endif
            >
                {{  $item->name }}
            </option>
        @endforeach
    </select>
    <i class="fas fa-caret-down text-gray-700 absolute bg-gray-300 block pl-2 pr-1"
       style="right:.3em;pointer-events: none;"
    ></i>

</div>
