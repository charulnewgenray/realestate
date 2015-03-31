<?php namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Lease_Pdf extends Model {

    protected $table = 'lease_documents_pdfs';
    protected $fillable = ['user_id','application_no','path'];

}
