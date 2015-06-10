<?php

namespace App\Controller;

use Cake\Core\Configure;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;


class SoaprController extends AppController {

  public function index() {
    if ($this->request->is('put')) {
      $json = $this->request->input();
    }
  }

}
