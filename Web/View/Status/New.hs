module Web.View.Status.New where
import Web.View.Prelude

data NewView = NewView { status :: Status }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={StatusesAction}>Statuses</a></li>
                <li class="breadcrumb-item active">New Status</li>
            </ol>
        </nav>
        <h1>New Status</h1>
        {renderForm status}
    |]

renderForm :: Status -> Html
renderForm status = formFor status [hsx|
    {(textField #name)}
    {submitButton}
|]
