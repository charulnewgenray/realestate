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
$router->get('/pdf/output', function() {
	$html = view('pdf')->render();
//	return PDF::load($html)->show();
	PDF::load($html)
		->filename('D:\Server\example1.pdf')
		->output();

	return 'PDF saved';
});
Route::get('/register', 'RegisterController@index');
Route::get('/register/application',['as' => 'register.application.index','uses' => 'RegisterController@index']);
Route::get('/register/loadApplication/{id}/{application_no}',['as' => 'register.application.load','uses' => 'RegisterController@load']);
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
		Route::get('/new-workorders',['as' => 'admin.dashboard.newworkorders','uses' => 'Admin\IndexController@getNewWorkorders']);
		Route::get('/new-applications',['as' => 'admin.dashboard.newapplications','uses' => 'Admin\IndexController@getNewApplications']);
		Route::get('/',['as' => 'admin.dashboard.index','uses' => 'Admin\IndexController@index']);
		Route::get('/applications',['as' => 'admin.applications.index','uses' => 'Admin\ApplicationsController@index']);
		Route::get('/applications/draft',['as' => 'admin.applications.draft','uses' => 'Admin\ApplicationsController@draft']);
		Route::get('/applications/submitted',['as' => 'admin.applications.submitted','uses' => 'Admin\ApplicationsController@submitted']);
		Route::get('/applications/accepted',['as' => 'admin.applications.accepted','uses' => 'Admin\ApplicationsController@accepted']);
		Route::get('/applications/{id}',['as' => 'admin.applications.showapplication','uses' => 'Admin\ApplicationsController@showapplication']);
		Route::get('/applications/search',['as' => 'admin.applications.search','uses' => 'Admin\ApplicationsController@search']);
		Route::get('/applications/show/{id}',['as' => 'admin.applications.show','uses' => 'Admin\ApplicationsController@show']);
		Route::post('/applications/comment',['as' => 'admin.applications.comment','uses' => 'Admin\ApplicationsController@applicationComment']);
		Route::get('/general/settings',['as' => 'admin.general.settings','uses' => 'Admin\IndexController@settings']);
		Route::get('/form/settings',['as' => 'admin.form.settings','uses' => 'Admin\IndexController@formSettings']);
		Route::post('/postform/settings',['as' => 'admin.form.postsettings','uses' => 'Admin\IndexController@postformSettings']);
		Route::post('/general/settings',['as' => 'admin.general.updates','uses' => 'Admin\IndexController@updateSettings']);
		/*Work order*/
		Route::post('/work-order-img',['as' => 'admin.workorders.image','uses' => 'Admin\WorkorderController@upload']);
		Route::get('/work-orders',['as' => 'admin.workorders','uses' => 'Admin\WorkorderController@index']);
		Route::get('/work-orders/{id}',['as' => 'admin.workorders.show','uses' => 'Admin\WorkorderController@show']);
		Route::post('/work-orders',['as' => 'tenant.workorder.update','uses' => 'Admin\WorkorderController@updateWorkorder']);
		Route::get('/work-order/settings',['as' => 'admin.workorders.settings','uses' => 'Admin\WorkorderController@settings']);
		Route::post('/work-order/settings/update',['as' => 'admin.workorder.settingsupdate','uses' => 'Admin\WorkorderController@updateSettings']);
		/* tenants */
		Route::get('/tenant/active',['as' => 'admin.tenant.active','uses' => 'Admin\TenantController@active']);
		Route::get('/tenant/pending',['as' => 'admin.tenant.pending','uses' => 'Admin\TenantController@pending']);
		Route::get('/tenant/canceled',['as' => 'admin.tenant.canceled','uses' => 'Admin\TenantController@canceled']);
		Route::get('/tenant/activeinfo/{id}',['as' => 'admin.tenant.activeinfo','uses' => 'Admin\TenantController@activeinfo']);
		Route::get('/tenant/pendinginfo/{id}',['as' => 'admin.tenant.pendinginfo','uses' => 'Admin\TenantController@pendinginfo']);
		Route::get('/tenant/canceledinfo/{id}',['as' => 'admin.tenant.canceledinfo','uses' => 'Admin\TenantController@canceledinfo']);
		Route::post('/tenant/pendingpost',['as' => 'admin.tenant.pendingpost','uses' => 'Admin\TenantController@pendingpost']);

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
		Route::get('/applications',['as' => 'tenant.applications.index','uses' => 'Tenant\ApplicationsController@index']);
		Route::get('/show/{id}',['as' => 'tenant.applications.show','uses' => 'Tenant\ApplicationsController@show']);
		Route::get('/draft',['as' => 'tenant.applications.draft','uses' => 'Tenant\ApplicationsController@draft']);
		Route::get('/submitted',['as' => 'tenant.applications.submitted','uses' => 'Tenant\ApplicationsController@submitted']);
		Route::get('/showapplication/{id}',['as' => 'tenant.applications.showapplication','uses' => 'Tenant\ApplicationsController@showapplication']);
		Route::post('/postapplication',['as' => 'tenant.applications.postapplication','uses' => 'Tenant\ApplicationsController@postapplication']);

		/*Work Order*/
		Route::get('/work-order',['as' => 'tenant.workorders.new','uses' => 'Tenant\WorkorderController@newWorkOrder']);
		Route::post('/work-order',['as' => 'tenant.workorders.create','uses' => 'Tenant\WorkorderController@create']);
		Route::post('/work-order-img',['as' => 'tenant.workorders.image','uses' => 'Tenant\WorkorderController@upload']);
		Route::get('/work-orders',['as' => 'tenant.workorders','uses' => 'Tenant\WorkorderController@index']);
		Route::get('/work-orders/{id}',['as' => 'tenant.workorders.show','uses' => 'Tenant\WorkorderController@show']);
	});
});


