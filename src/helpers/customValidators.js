module.exports.passwordValidator = password => {
  const regName = /^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$/
  return regName.test(password)
}
module.exports.nameValidator = name => {
  const regName = /^[a-zA-Z][a-zA-Z\s]*$/
  return regName.test(name)
}
