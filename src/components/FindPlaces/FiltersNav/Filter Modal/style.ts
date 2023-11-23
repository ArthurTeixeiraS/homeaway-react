import styled from 'styled-components'

export const ModalContainer = styled.div`
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.3);
  transition: all 0.5s ease-in-out;

  .modal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 1.5rem;
    border: 1px solid black;
    border-radius: 1rem;
    .title {
      display: flex;
      align-items: center;
      justify-content: center;
      button {
        position: fixed;
        left: 47rem;
        justify-content: flex-end;
        border: 0;
        background-color: transparent;
        &:hover {
          cursor: pointer;
        }
      }
    }
    p {
      font-size: 1.5rem;
      text-align: center;
    }
    .filters {
      padding: 2rem 1rem 0 1rem;
      label {
        font-size: 1.2rem;
        font-weight: bold;
      }
      .priceRange {
        display: flex;
        justify-content: space-around;
        align-items: center;
        .separador {
          margin-left: 1rem;
        }
        input[type='text'] {
          border: 1px solid black;
          border-radius: 1.2rem;
          padding: 0.5rem;
          height: 3.3rem;
          font-weight: bold;
          font-size: 1.3rem;
        }
      }
      .checkin-out {
        padding-top: 2rem;
        .checkin {
          margin-bottom: 2rem;
        }
        .checkin,
        .checkout {
          display: flex;
          align-items: center;
        }
        input {
          border: 1px solid black;
          padding: 0.5rem;
          height: 3.3rem;
          border-radius: 1.2rem;
          font-weight: bold;
          font-size: 1.3rem;
        }
      }
    }
  }
`
