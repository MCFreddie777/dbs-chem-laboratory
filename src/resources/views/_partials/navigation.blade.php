@php
    $navigation = [
        [
            'title' => '',
            'items' => [
                [
                    'path'=>'/samples',
                    'icon'=>'fas fa-vial',
                    'title'=> 'Vzorky',
                ],
                 [
                    'path'=>'/analyses',
                    'icon'=>'fas fa-microscope',
                    'title'=> 'Analýzy',
                ],
                [
                    'path' => '/grants',
                    'icon' => 'fas fa-file-invoice-dollar',
                    'title'=> 'Granty',
                    'gates' => ['garant','admin']
                ]
            ]
        ],
        [
            'title' => 'Administrácia',
            'gates' => ['admin'],
            'items' => [
                [
                    'path'=> '/users',
                    'icon'=> 'fas fa-user-friends',
                    'title'=> 'Správa užívateľov'
                ],
                [
                    'path'=> '/administration',
                    'icon'=> 'fas fa-tools',
                    'title'=> 'Správa laboratórií'
                ]
            ]
        ],
        [
            'title'=> 'Účet',
            'items'=> [
                [
                    'path'=> '/change-password',
                    'icon'=> 'fas fa-lock',
                    'title'=> 'Zmena hesla'
                ],
                [
                    'path'=> '/logout',
                    'icon'=> 'fas fa-sign-out-alt',
                    'title'=> 'Odhlásiť sa'
                ]
            ]
        ]
    ];
@endphp

<div
    class="flex flex-col bg-gray-800 shadow-lg w-36 sm:w-48 md:w-56 xl:w-64"
    style="transition: width 0.1s ease-in-out;"
>

    <a href="/">
        <div
            class="logo flex justify-center bg-yellow-500 h-16"
        >
            <img
                src="{{ asset('img/logo.svg') }}"
                alt=""
                class="h-full w-full py-4"
            >
        </div>
    </a>

    <nav class="flex flex-col flex-1">
        @foreach($navigation as $group)
            <x-navigation.item-group
                :group="$group"
            ></x-navigation.item-group>
        @endforeach

        <div class="flex flex-1 items-end">
            <a
                href="javascript:void(0)"
                class="text-gray-600 hover:text-gray-500 p-5 w-full text-center"
            >
                <i
                    class="fas fa-chevron-left"
                >
                </i>
            </a>
        </div>
    </nav>
</div>
