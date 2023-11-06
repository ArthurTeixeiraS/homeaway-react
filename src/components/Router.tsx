import { Routes, Route } from 'react-router-dom'
import { Home } from '../pages/Home'
import { DefaultLayout } from '../layouts/DefaultLayout'
import { Register } from '../pages/Register'
import { RegisterPartner } from '../pages/RegisterPartner'
import { LoginForm } from './LoginForm'

export function Router() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/" element={<DefaultLayout />}>
          <Route path="/singup" element={<Register />} />
          <Route path="/singupPartner" element={<RegisterPartner />} />
          <Route path="/login" element={<LoginForm />} />
        </Route>
      </Routes>
    </>
  )
}
