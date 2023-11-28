export type Hotel = {
  id: string
  name: string
  description: string
  uf: string
  city: string
  neighbourhood: string
  street: string
  number: string
  allowsPets: boolean
  hasWifi: boolean
  hasRoomService: boolean
  referenceImage: string
  classification: number
  user: {
    id: string
    name: string
    email: string
  }
}
