import styled from 'styled-components'

export const AddRoom = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 8rem;

  form {
    border: 1px solid ${(props) => props.theme['yellow-secondary']};
    border-radius: 1.5rem;
    padding: 2.5rem;
    h1 {
      border-bottom: 1px solid ${(props) => props.theme['border-gray']};
      padding-bottom: 0.5rem;
      span {
        color: ${(props) => props.theme['yellow-secondary']};
      }
    }
    .buttons {
      display: flex;
      justify-content: space-evenly;
      padding: 2rem;
      button {
        padding: 1rem 2rem;
        font-size: 1.5rem;
        border-radius: 1rem;
        border: 0;
      }
    }
    .inputs {
      display: flex;
      flex-direction: column;
    }
  }
`
