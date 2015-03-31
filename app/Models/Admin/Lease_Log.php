<?php namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Lease_Log extends Model {

    protected $table = 'lease_agreement_log';
    protected $fillable = ['user_email','applicant_email','status','start_date','end_date'];

}
