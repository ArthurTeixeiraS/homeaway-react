import { useEffect, useState } from 'react'
import { AuthContext } from './AuthContext'
import { User } from '../../@types/User'
import { UseAPI } from '../../hooks/useApi'

export const AuthProvider = ({ children }: { children: JSX.Element }) => {
  const [user, setUser] = useState<User | null>(null)
  const api = UseAPI()

  useEffect(() => {
    const validateToken = async () => {
      let data
      const storageData = localStorage.getItem('authToken')
      /*    console.log(storageData) */
      if (storageData) {
        try {
          data = await api.validateToken(storageData)
        } catch (err) {
          console.log(err)
        }
        if (data) {
          setUser(data)
        }
      }
    }
    validateToken()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const singin = async (email: string, password: string) => {
    const data = await api.singin(email, password)
    console.log(data)
    if (data.token) {
      setUser(data)
      setToken(data.token)
      return true
    }
    return false
  }

  const singout = async () => {
    /*     await api.logout() */
    setUser(null)
    setToken('')
  }

  const setToken = (token: string) => {
    localStorage.setItem('authToken', token)
  }

  return (
    <AuthContext.Provider value={{ user, singin, singout }}>
      {children}
    </AuthContext.Provider>
  )
}
