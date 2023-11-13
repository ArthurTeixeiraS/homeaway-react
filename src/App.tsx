import { ThemeProvider } from 'styled-components'
import { defaultTheme } from './styles/themes/default'
import { GlobalStyle } from './styles/global'
import { BrowserRouter } from 'react-router-dom'
import { Router } from './components/Router'
/* import { useEffect } from 'react'
import axios from 'axios' */

// eslint-disable-next-line @typescript-eslint/no-unused-vars
/* let isHost: boolean = false
const userLoginVerify = 'http://localhost:8080/verify' */

export function App() {
  /* useEffect(() => {
    const storedToken = localStorage.getItem('token')
    console.log('EXECUTOU VERIFICAÇÃO')
    if (storedToken) {
      verifyAndLogin(storedToken)
    }
  }, [])

  const verifyAndLogin = async (token: string) => {
    try {
      const response = await axios.get(userLoginVerify, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      if (response.status === 200) {
        if (response.data.role === 'host') isHost = true
        return true
      }
    } catch (error) {
      console.error('Erro ao verificar o token:', error)
      localStorage.removeItem('token')
      return false
    }
  } */
  return (
    <ThemeProvider theme={defaultTheme}>
      <BrowserRouter>
        <Router />
      </BrowserRouter>

      <GlobalStyle />
    </ThemeProvider>
  )
}
