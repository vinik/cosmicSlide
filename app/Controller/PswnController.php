<?php

App::uses('AppController', 'Controller');


class PswnController extends AppController {

  public function sheeps() {
    if ($this->request->is('put')) {
      $jsonInput = $this->request->input();
      $json = json_decode($jsonInput);

      echo "<PRE>";
      die(var_dump($json));

    }

    die();
  }

}
