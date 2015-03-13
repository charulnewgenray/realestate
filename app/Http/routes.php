<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', 'WelcomeController@index');


Route::get('/home', function(){
	if(Auth::user()->hasRole('Administrator'))
		return Redirect::to('/admin');
	elseif(Auth::user()->hasRole('Customer'))
		return Redirect::to('/customer');
	elseif(Auth::user()->hasRole('Tenant'))
		return Redirect::to('/tenant');
	else return Redirect::to('/');

});

Route::get('/register', 'RegisterController@index');
Route::get('/register/application',['as' => 'register.application.index','uses' => 'RegisterController@index']);
Route::get('/register/application/{id}',['as' => 'register.application','uses' => 'RegisterController@show']);
Route::post('/register/login',['as' => 'register.login','uses' => 'RegisterController@login']);
Route::post('/register/signup',['as' => 'register.signup','uses' => 'RegisterController@signup']);
Route::post('/register/application/postRegister',['as' => 'register.register.postRegister','uses' => 'RegisterController@postRegister']);
Route::post('/register/application/create/',['as' => 'register.application.create','uses' => 'RegisterController@create']);
Route::post('/register/application/getApplications/',['as' => 'register.application.get','uses' => 'RegisterController@getApplications']);

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);

/* Administrator Routes */

Route::group([
	'middleware' => 'vault.routeNeedsRole',
	'role' => ['Administrator'],
	'redirect' => 'auth/login',
	'with' => ['error', 'You do not have access to do that.']
], function()
{
	Route::group(['prefix' => 'admin'], function ()
	{
		/*Administrator Management*/
		Route::get('/',['as' => 'admin.dashboard.index','uses' => 'Admin\IndexController@index']);
		Route::get('/applications',['as' => 'admin.applications.index','uses' => 'Admin\ApplicationsController@index']);
		Route::get('/draft',['as' => 'admin.applications.draft','uses' => 'Admin\ApplicationsController@draft']);
		Route::get('/submitted',['as' => 'admin.applications.submitted','uses' => 'Admin\ApplicationsController@submitted']);
		Route::get('/showapplication/{id}',['as' => 'admin.applications.showapplication','uses' => 'Admin\ApplicationsController@showapplication']);
		Route::get('/search',['as' => 'admin.applications.search','uses' => 'Admin\ApplicationsController@search']);
		Route::get('/show/{id}',['as' => 'admin.applications.show','uses' => 'Admin\ApplicationsController@show']);
		Route::get('/work-orders',['as' => 'tenant.workorder.index','uses' => 'Tenant\WorkorderController@index']);
		Route::get('/work-orders',['as' => 'tenant.workorder.','uses' => 'Tenant\WorkorderController@index']);
	});
});

/* Customer Routes */
Route::group([
	'middleware' => 'vault.routeNeedsRole',
	'role' => ['Customer'],
	'redirect' => 'auth/login',
	'with' => ['error', 'You do not have access to do that.']
], function()
{
	Route::group(['prefix' => 'customer'], function ()
	{
		/*Administrator Management*/

	});
});

/* Tenant Routes */
Route::group([
	'middleware' => 'vault.routeNeedsRole',
	'role' => ['Tenant'],
	'redirect' => 'auth/login',
	'with' => ['error', 'You do not have access to do that.']
], function()
{
	Route::group(['prefix' => 'tenant'], function ()
	{
		Route::get('/',['as' => 'tenant.dashboard.index','uses' => 'Tenant\IndexController@index']);
		Route::get('/',['as' => 'tenant.work-orders','uses' => 'Tenant\IndexController@getWorkOrders']);
		Route::get('/applications',['as' => 'tenant.applications.index','uses' => 'Tenant\ApplicationsController@index']);
		Route::get('/show/{id}',['as' => 'tenant.applications.show','uses' => 'Tenant\ApplicationsController@show']);
		Route::get('/work-orders',['as' => 'tenant.workorders','uses' => 'Tenant\WorkorderController@index']);
	});
});


