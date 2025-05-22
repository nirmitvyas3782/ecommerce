<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Device;
use Jenssegers\Agent\Agent;

class LogDeviceInfo
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        
            $agent = new Agent();
    
            $deviceInfo = [
                'device_type' => $agent->device(), // e.g., iPhone, Windows
                'device_name' => $agent->isDesktop() ? 'Desktop' : ($agent->isMobile() ? 'Mobile' : 'Tablet'),
                'browser'     => $agent->browser(),
                'browser_version' => $agent->version($agent->browser()),
                'platform'    => $agent->platform(),
                'platform_version' => $agent->version($agent->platform()),
                'ip_address'  => $request->ip(),
            ];
    
            Device::create($deviceInfo);
            
        

        return $next($request);
    }
}
