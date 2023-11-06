import styled from 'styled-components'

export const LoginContainer = styled.div`
  background-color: ${(props) => props.theme.white};
  width: 40%;
  height: 60%;
  z-index: 5;
  border-radius: 2.8rem;
  border: 2px solid ${(props) => props.theme['blue-primary']};
  padding: 2rem;
  margin: 0 auto !important;
  display: flex;
  justify-content: center;
  align-items: center;
`
