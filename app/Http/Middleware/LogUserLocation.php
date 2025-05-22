<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use App\Models\Location;
use Illuminate\Support\Facades\Http;

class LogUserLocation
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (Auth::check() && $request->is('admin/*')) {
            $user = Auth::user();
            $ip = $request->ip();

            // Avoid duplicate logs in same session
            if (!session()->has('user_location_logged')) {
                $geo = Http::get("http://ip-api.com/json/{$ip}?fields=status,message,lat,lon,city,country");

                if ($geo->ok() && $geo['status'] === 'success') {
                    Location::create([
                        'user_id'       => $user->id,
                        'user_type'     => $user->user_type,
                        'user_location' => $geo['city'] . ', ' . $geo['country'],
                        'user_lat'      => $geo['lat'],
                        'user_lon'      => $geo['lon'],
                        'user_ip'       => $ip,
                    ]);

                    session(['user_location_logged' => true]);
                }
            }
        }

        return $next($request);
    }
}
