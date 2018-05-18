<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

use Closure;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        //
    ];

    public function handle($request, Closure $next)
	{
        // Add this:
        if($request->method() == 'POST')
        {
		return $next($request);
        }

		if ($request->method() == 'GET' || $this->tokensMatch($request))
		{
			return $next($request);
		}
		throw new TokenMismatchException;
	}
}
