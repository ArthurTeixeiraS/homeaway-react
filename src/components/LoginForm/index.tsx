import { LoginContainer, BackGroundImage } from './styles'
export function LoginForm() {
  return (
    <BackGroundImage>
      <LoginContainer>
        <div className="titleContainer">
          <h2>Faça já seu login</h2>
          <p>É bom te ver denovo</p>
        </div>
      </LoginContainer>
    </BackGroundImage>
  )
}
