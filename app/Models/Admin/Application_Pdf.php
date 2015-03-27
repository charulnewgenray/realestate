<?php namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Application_Pdf extends Model {

    protected $table = 'application_pdfs';
    protected $fillable = ['user_id','application_no','path'];

}
