import { styled } from 'styled-components'

export const Container = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 2.5rem;
  input {
    display: none;
  }
  .labelImage {
    background: ${(props) => props.theme['yellow-secondary']};
    color: ${(props) => props.theme.white};
    border-radius: 1rem;
    p {
      padding: 0.6rem;
    }
  }
  div {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    h2 {
      padding: 0.5rem;
    }
    img {
      width: 300px;
      height: 200px;
    }
  }
`
