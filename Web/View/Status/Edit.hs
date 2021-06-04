module Web.View.Status.Edit where
import Web.View.Prelude

data EditView = EditView { status :: Status }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={StatusesAction}>Statuses</a></li>
                <li class="breadcrumb-item active">Edit Status</li>
            </ol>
        </nav>
        <h1>Edit Status</h1>
        {renderForm status}
    |]

renderForm :: Status -> Html
renderForm status = formFor status [hsx|
    {(textField #name)}
    {submitButton}
|]
