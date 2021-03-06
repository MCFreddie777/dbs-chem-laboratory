<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    public $timestamps = false;
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password'
    ];

    public function role()
    {
        return $this->belongsTo('App\Role');
    }

    public function samples()
    {
        return $this->hasMany('App\Sample');
    }

    public function analyses()
    {
        return $this->hasMany('App\Analysis');
    }

    public function grants()
    {
        return $this->belongsToMany('App\Grant', 'grant_user');
    }

    /**
     * Checks if user has role in the parameter
     *
     * @param $role
     * @return bool
     */
    public function hasRole($role)
    {
        return $this->role->name === $role;
    }

    public function scopeJoinRolesTable($query)
    {
        return $query
            ->leftjoin('roles', 'roles.id', '=', 'users.role_id');
    }

    public function scopeJoinSamplesTable($query)
    {
        return $query
            ->leftjoin('samples', 'samples.user_id', '=', 'users.id');
    }

    public function scopeSearch($query, $search)
    {
        if (!$search) return $query;
        return $query
            ->distinct()
            ->where('users.login', 'like', '%' . $search . '%')
            ->orWhere('roles.name', 'like', '%' . $search . '%');
    }
}
