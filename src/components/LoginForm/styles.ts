import styled from 'styled-components'
import banner from '../../assets/backgrounds/banner-blur.png'

export const LoginContainer = styled.div`
  background-color: ${(props) => props.theme.white};
  width: 40%;
  height: 60%;
  z-index: 5;
  border-radius: 2.8rem;
  padding: 2rem;
  margin: 0 auto !important;
  display: flex;
  justify-content: center;
  align-items: center;
  .titleContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding-bottom: 1rem;
    border-bottom: 1px solid ${(props) => props.theme['border-gray']};
    h2 {
      font-size: 2.5rem;
    }
    p {
      font-size: 1.2rem;
    }
  }
`
export const BackGroundImage = styled.div`
  width: 100%;
  height: 100vh;
  background-image: url(${banner});
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;
  justify-content: center;
  align-items: center;
`
