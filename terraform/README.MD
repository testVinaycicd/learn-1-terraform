COMMON PITFALLS AND HOW TO AVOID THEM

-> not using remote state / no locking

-> leaving secrets in state file    

-> not pinning provider version / ignoring

-> don't use count when identity matters cause count is positional so use for_each

-> mixing manual changes with terraform ex someone changes infra in console -> run plan regularly

-> don't create a module that do too much keep it simple accept inputs and export minimal outputs

-> insufficient IAM on backend ex exposing state to whole org fix with appropriate read / write access to the backend bucket

-> running terraform in CI without locking credential or provider version



