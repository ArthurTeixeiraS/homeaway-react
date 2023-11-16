import { ThemeProvider } from 'styled-components'
import { defaultTheme } from './styles/themes/default'
import { GlobalStyle } from './styles/global'
import { BrowserRouter } from 'react-router-dom'
import { Router } from './components/Router'
import { useEffect } from 'react'
import axios from 'axios'
import { BaseURL } from './main'

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export let isHost: boolean = false
export let isLogged: boolean = false

export function App() {
  useEffect(() => {
    const storedToken = localStorage.getItem('token')
    if (storedToken) {
      verifyAndLogin(storedToken)
    } else {
      console.error('Não existem Tokens no LocalStorage!')
    }
  }, [])

  const verifyAndLogin = async (token: string) => {
    try {
      const response = await axios.get(`${BaseURL}/users/me`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      /* console.log(response) */
      if (response.status === 200) {
        const { role } = response.data
        if (role === 'HOST') isHost = true
        isLogged = true
        console.log(token, isLogged, isHost)
        return true
      }
    } catch (error) {
      console.error('Erro ao verificar o token:', error)
      localStorage.removeItem('token')
      return false
    }
  }
  return (
    <ThemeProvider theme={defaultTheme}>
      <BrowserRouter>
        <Router />
      </BrowserRouter>

      <GlobalStyle />
    </ThemeProvider>
  )
}
