import { Routes, Route } from 'react-router-dom'
import { Home } from '../pages/Home'
import { DefaultLayout } from '../layouts/DefaultLayout'
import { Register } from '../pages/Register'
import { RegisterPartner } from '../pages/RegisterPartner'
import { Login } from '../pages/Login'
import { Error } from '../pages/Errors'
import { HotelRegister } from '../pages/HotelRegistration'
import { MyHotelsPage } from '../pages/MyHotels'

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
          <Route path="/addHotel" element={<HotelRegister />} />
          <Route path="/myHotels" element={<MyHotelsPage />} />
        </Route>
      </Routes>
    </>
  )
}
