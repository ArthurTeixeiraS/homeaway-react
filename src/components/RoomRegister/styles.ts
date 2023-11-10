import styled from 'styled-components'

export const AddRoom = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 5rem 8rem;

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
      label {
        font-weight: bold;
        font-size: 1.5rem;
        padding: 0.5rem 0 1rem 0.5rem;
      }
      input[type='text'] {
        width: 100%;
        outline: none;
        height: 4rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 0.5rem;
        font-size: 1.3rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
      }
      textarea {
        padding: 1rem;
        width: 100%;
        outline: none;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 0.5rem;
        font-size: 1.3rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
      }
    }
    .priceAndMaxP {
      display: grid;
      grid-template-columns: 20rem 20rem;
      grid-row: auto auto;
      grid-column-gap: 2rem;
      #dailyPrice {
        width: 80%;
      }
      input[type='number'] {
        width: 80%;
        outline: none;
        height: 4rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 0.5rem;
        font-size: 1.3rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
      }
    }
    .address {
      display: grid;
      grid-template-columns: 20rem 20rem;
      grid-column-gap: 2rem;
      #dailyPrice {
        width: 80%;
      }
      input[type='number'] {
        width: 80%;
        outline: none;
        height: 4rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        font-size: 1.3rem;
        font-weight: bold;
      }
    }
  }
`
