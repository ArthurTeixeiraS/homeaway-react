export type User = {
  id?: number
  name: string
  email: string
  password: string
  repeatPassword?: boolean
  birthDate?: string
  role: string
  document?: string
  registrationDate: string
}
