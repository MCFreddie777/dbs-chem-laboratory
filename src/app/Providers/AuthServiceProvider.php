<?php

namespace App\Providers;

use App\User;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('user', function (User $user) {
            return $user->hasRole('user');
        });

        Gate::define('garant', function (User $user) {
            return $user->hasRole('garant');
        });

        Gate::define('laborant', function (User $user) {
            return $user->hasRole('laborant');
        });

        Gate::define('admin', function (User $user) {
            return $user->hasRole('admin');
        });
    }
}
