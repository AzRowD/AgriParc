import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class MaterielService {
  private apiUrl = "http://localhost:3000";
  private params = "??";
  private opts = {};

  private listeMateriel;

  constructor(private http: HttpClient) { 

  }
  //Recupère la liste du matériel
  getMateriel(): Promise<any> {
    
    this.listeMateriel = this.http.get(`${this.apiUrl}/materiel`)
      .toPromise()
      .then(result => {
        return result;
      }, error => {
        console.error("REQUEST GET /listeMateriel PROMISE ERROR");
      });

    return this.listeMateriel;
  }


  getMaterielSearch(){
   
    this.listeMateriel = this.http.get(`${this.apiUrl}/materiel/:id`)
      .toPromise()
      .then(result => {
        return result;
      }, error => {
        console.error("REQUEST GET /Materiel PROMISE ERROR");
      });

    return this.listeMateriel;
  }
}
