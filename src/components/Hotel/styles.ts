import { styled } from 'styled-components'

export const Container = styled.div`
  padding: 5%;
  display: flex;
  flex-direction: column;
`

export const TitleContainer = styled.div`
  display: flex;
  margin-bottom: 5rem;
  justify-content: space-between;
  align-items: center;
  a {
    text-decoration: none;
    button {
      background-color: ${(props) => props.theme['yellow-secondary']};
      color: white;
      padding: 1rem 3rem;
      font-weight: bold;
      font-size: 1.3rem;
      border-radius: 1.5rem;
      border: 0;
    }
  }
  h1 {
    text-align: start;
    font-size: 2.5rem;
  }
`
