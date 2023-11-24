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
    border: 2.5px solid ${(props) => props.theme['blue-primary']};
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
        #close-icon {
          color: ${(props) => props.theme['blue-primary']};
        }
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
        margin-right: 1rem;
      }
      .checkboxes {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        .checkContainer {
          margin-top: 2rem;
          display: flex;
          align-items: center;
          label {
            font-size: 1.2rem;
            font-weight: bold;
          }
          input[type='checkbox'] {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid ${(props) => props.theme['blue-primary']};
            background-color: white;
            border-radius: 4px;
            cursor: pointer;
          }
          input[type='checkbox']:checked {
            background-color: ${(props) => props.theme['blue-primary']};
          }
        }
      }
      .priceRange {
        display: flex;
        justify-content: space-around;
        align-items: center;
        .separador {
          margin-left: 1rem;
        }
        input[type='text'] {
          border: 1px solid ${(props) => props.theme['blue-primary']};
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
          border: 1px solid ${(props) => props.theme['blue-primary']};
          padding: 0.5rem;
          height: 3.3rem;
          width: 37rem;
          border-radius: 1.2rem;
          font-weight: bold;
          font-size: 1.3rem;
        }
      }
    }
    .button {
      margin-top: 2rem;
      display: flex;
      justify-content: center;
      button {
        margin-right: 1rem;
        width: 40%;
        height: 4.5rem;
        border-radius: 2rem;
        border: 0;
        background: ${(props) => props.theme['blue-primary']};
        color: white;
        font-size: 1.3rem;
      }
    }
  }
`
