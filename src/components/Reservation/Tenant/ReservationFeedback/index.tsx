import { FaStar } from 'react-icons/fa'
import { ContainerFeed } from './styles'

type FeedBackProps = {
  isActive: boolean
  onClick: () => void
}

export function FeedBackComponent({ isActive, onClick }: FeedBackProps) {
  return (
    <ContainerFeed className="starbutton" onClick={onClick}>
      <FaStar fill={isActive ? '#ffb60a' : '#ccc'} size={20} />
    </ContainerFeed>
  )
}
