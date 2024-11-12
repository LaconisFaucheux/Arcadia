import { Injectable } from '@angular/core';
import {environment} from "../../environnements/environnement";

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  private apiUrl = environment.apiUrl;
  private imageApiUrl = environment.imageApiUrl;
  private meteoApiUrl = environment.meteoApiUrl;

  constructor() { }

  public getapiUrl() {
    return this.apiUrl;
  }

  public getImageApiUrl() {
    return this.imageApiUrl;
  }

  public getMeteoApiUrl() {
    return this.meteoApiUrl;
  }
}
