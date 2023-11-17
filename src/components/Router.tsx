import { Routes, Route } from 'react-router-dom'
import { Home } from '../pages/Home'
import { DefaultLayout } from '../layouts/DefaultLayout'
import { Register } from '../pages/Register'
import { RegisterPartner } from '../pages/RegisterPartner'
import { Login } from '../pages/Login'
import { Error } from '../pages/Errors'
import { HotelRegister } from '../pages/HotelRegistration'
import { MyHotelsPage } from '../pages/MyHotels'
import { AccountPage } from '../pages/Account'
import { AccountEditPage } from '../pages/AccountEdit'
import { HotelEditPage } from '../pages/HotelEdit'

export function Router() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/" element={<DefaultLayout />}>
          <Route path="*" element={<Error />} />
          <Route path="/singup" element={<Register />} />
          <Route path="/singupPartner" element={<RegisterPartner />} />
          <Route path="/login" element={<Login />} />
          <Route path="/users/addHotel" element={<HotelRegister />} />
          <Route path="/users/myHotels" element={<MyHotelsPage />} />
          <Route path="/users/myHotels/edit" element={<HotelEditPage />} />
          <Route path="/users/me" element={<AccountPage />} />
          <Route path="/users/edit" element={<AccountEditPage />} />
        </Route>
      </Routes>
    </>
  )
}
