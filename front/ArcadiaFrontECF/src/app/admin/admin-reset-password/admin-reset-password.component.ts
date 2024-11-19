import { Component } from '@angular/core';
import {FormControl, FormsModule, ReactiveFormsModule, Validators} from "@angular/forms";
import {AuthService} from "../../../shared/services/auth.service";
import {UsersService} from "../../../shared/services/users.service";
import {ActivatedRoute, ParamMap} from "@angular/router";
import {Observable} from "rxjs";
import {IUser} from "../../../shared/interfaces/user.interface";
import {AsyncPipe} from "@angular/common";

@Component({
  selector: 'app-admin-reset-password',
  standalone: true,
  imports: [
    FormsModule,
    ReactiveFormsModule,
    AsyncPipe
  ],
  templateUrl: './admin-reset-password.component.html',
  styleUrl: './admin-reset-password.component.css'
})
export class AdminResetPasswordComponent {

  //PROPS
  public id: string | null = ''
  public user$: Observable<IUser | undefined> = new Observable<IUser | undefined>();
  private user: IUser | undefined = undefined;

  //FORM CONTROLS
  public NewPassword = new FormControl<string>('', [Validators.required])
  public NewPasswordCheck = new FormControl('', [Validators.required])
  public RandomPassword = new FormControl('')

  protected potentialPassword = "";
  protected passwordCheck = "";
  private passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$/;
  protected matchingPasswords: boolean = false;
  protected isPwdCompliant: boolean = false;
  private _canSend = false;

  constructor(private authService: AuthService,
              private userService: UsersService,
              private activatedRoute: ActivatedRoute) {
    this.user$ = this.userService.user$
  }

  ngOnInit() {
    this.activatedRoute.paramMap.subscribe((paramMap: ParamMap) => {
      this.id = paramMap.get('id');
      if (this.id) {
        this.userService.fetchUniqueEmployee(this.id);
      }
    });

    this.user$.subscribe(u => {
      this.user = u;
    })

    this.generatePassword()

  }



  submit() {
    this._canSend = this.isPwdCompliant && this.matchingPasswords;
    if(!this._canSend) {return;}

    // if (this.NewPassword.value !== this.NewPasswordCheck.value) {
    //   alert('Le nouveau mot de passe et sa confirmation ne correspondent pas!');
    //   return;
    // }

    if (!this.user) return

    const fd = new FormData();

    if (this.user.id) {
      fd.append('id', this.user.id)
    } else {
      return;
    }

    fd.append('email', this.user.email)

    if(this.NewPassword.value) {
      fd.append('newPassword', this.NewPassword.value?.toString());
    } else {
      alert('Tous les champs sont REQUIS');
      return;
    }

    this.authService.resetPassword(this.user.id, fd);
  }

  generatePassword(): string {
    const pwd = this.userService.generatePassword()
    this.RandomPassword.setValue(pwd)
    return pwd;
  }

  public checkPassword() {
    if (this.potentialPassword !== "") {
      this.isPwdCompliant = this.passwordRegex.test(this.potentialPassword)
    }

    if(this.potentialPassword !== "" && this.passwordCheck !== "") {
      this.matchingPasswords = this.potentialPassword === this.passwordCheck
    }
  }

  public setPasswordCheck(event: any) {
    if (event.target.value) {
      this.passwordCheck = event.target.value
      this.checkPassword()
    }
  }

  public setPotentialPwd(event: any) {
    if (event.target.value) {
      this.potentialPassword = event.target.value
      this.checkPassword()
    }
  }
}
