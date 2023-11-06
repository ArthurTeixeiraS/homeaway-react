import styled from 'styled-components'

export const LoginContainer = styled.div`
  background-color: ${(props) => props.theme.white};
  width: 40%;
  height: 82%;
  z-index: 5;
  border-radius: 2.8rem;
  border: 2px solid ${(props) => props.theme['blue-primary']};
  padding: 3rem;
`
