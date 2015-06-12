<?php

App::uses('AppController', 'Controller');


class PswnController extends AppController {

  public $uses = array('Sensor');

  public function sheeps() {
    if ($this->request->is('put')) {
      $jsonInput = $this->request->input();
      $json = json_decode($jsonInput);

      echo "<PRE>";
      die(var_dump($json));

      foreach ($json->item as $item) {

        $data = array(
          'par1:sensorIdentification'   => $item->id,
          'par1:status'                 => '1',
          'par1:lastStatusDate'         => date('2015-05-21T12:43:00')
        );

        $resp = $this->Sensor->query('SaveParkingSpace', array($data));

        echo "<PRE>";
        die(var_dump($resp));
      }
    }

    die();
  }

}
