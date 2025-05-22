<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User;

class CustomAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (!session()->has('custom_auth_user')) {
            return redirect()->route('auth.login')->with('failed', 'Please log in first.');
        }
    
        // Optionally inject authenticated user
        if (!auth()->check()) {
            $user = User::find(session('custom_auth_user'));

            if ($user) {
                auth()->login($user);
            }
        }
    
        return $next($request);
    }
}
