abstract class AccountState{}
 class AccountInitState extends AccountState{}
 class AccountLoadingState extends AccountState{}
 class AccountSuccessState extends AccountState{}
 class AccountErrorState extends AccountState{
 final String? errorMessage;

  AccountErrorState({ this.errorMessage});
 }
 class AccountChangeParamsState extends AccountState{}