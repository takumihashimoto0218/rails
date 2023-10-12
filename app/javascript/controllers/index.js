import { Application } from '@hotwired/stimulus'
import Sortable from 'stimulus-sortable'

const application = Application.start()
application.register('sortable', Sortable)